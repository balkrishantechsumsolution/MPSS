<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="CitizenBriefcase.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.CitizenBriefcase" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">

        function fnNext() {
            debugger;
            var qs = getQueryStrings();
            var appid = qs["AppID"];
            var svcid = qs["SvcID"];
            if (svcid == '386') {
                window.location = "Default.aspx";
            } else {
                window.location = "../Forms/ConfirmPayment.aspx?AppID=" + appid + "&SvcID=" + svcid + "";
            }
        }
        $(document).ready(function () {
            var qs = getQueryStrings();
            var svcid = qs["SvcID"];
            if (svcid == '386') {
                $('#btnNext').val("Submit");
            }
            $("#liBasic").removeClass("active");
            $("#liService").removeClass("active");
            $("#liDetails").removeClass("active");
            $("#liDoc").addClass("active");
            $("#liPayment").removeClass("active");

            $("#step1").addClass("stepfinish");
            $("#step2").addClass("stepfinish");
            $("#step3").addClass("stepfinish");
            $("#step4").addClass("stepactive ");
            $("#step5").addClass("active");
            $("#step6").addClass("active");
            $("#step7").addClass("active");
        });

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

    </script>
    <style type="text/css">
        .fldupload {
            position: absolute;
            margin: -40px 0 0 8px;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 120px;
            height: 30px;
        }

        .error {
        }

        .btnUpload {
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            content: "\f019";
        }
    </style>
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
                <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                <%----Start of Attachment-----%>
                <%--<div class="row" id="divAtt" runat="server">
					
				</div>--%>
                <%-----End of Attachment------%>

                <%----Start of Attachment-----%>
                <div class="row" id="divSearch" runat="server">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Details of Uploaded Document
                            </h4>
                        </div>
                        <div class="box-body box-body-open" style="padding: 10px;">
                            
                            <div runat="server" id="divErr">
                                
                            </div>
                            <asp:GridView ID="gvDoc" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-striped table-bordered" OnRowCommand="gvDoc_RowCommand"
                                OnRowDataBound="gvDoc_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>.<asp:Label ID="lblIsMandatory" runat="server"
                                                Text="*" ForeColor="Red" Visible="false"> </asp:Label>                                            
                                            <asp:Label ID="lblDocID" runat="server" Text='<%# Eval("DocID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblIsUploaded" runat="server" Text='<%# Eval("IsUploaded") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DocDesc" HeaderText="Document Description"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Download">
                                        <ItemTemplate>
                                            <%--<span class="btn btn-primary">
												<i class="fa fa-download"></i>
												<span>Download</span>
												<asp:HyperLink ID="hlMySite" runat="server" class="btn" 
													NavigateUrl='<%# Eval("Path") %>' Target="_blank" Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>'
													Text="Download">
												</asp:HyperLink>
											</span>--%>
                                            <asp:HyperLink ID="hlMySite" runat="server" ToolTip="Click to download the file"
                                                NavigateUrl='<%# Eval("Path") %>' Target="_blank" Visible='<%# Convert.ToBoolean( Eval("IsUploaded")) %>'
                                                Text="Download"> <img src="../../Kiosk/Images/download.png" style="width:50px;height:50px"></img></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <%--<EditRowStyle BackColor="#7C6F57" />
								<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
								<HeaderStyle BackColor="#e8f4da" Font-Bold="True" ForeColor="Black" BorderColor="Gray"
									BorderStyle="Solid" BorderWidth="1px" />
								<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
								<RowStyle BackColor="#E3EAEB" />
								<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
								<SortedAscendingCellStyle BackColor="#F8FAFA" />
								<SortedAscendingHeaderStyle BackColor="#246B61" />
								<SortedDescendingCellStyle BackColor="#D4DFE1" />
								<SortedDescendingHeaderStyle BackColor="#15524A" />--%>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <%-----End of SearhBasicDetails------%>
                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">

                            <%--<input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />--%>
<%--                            <asp:Button ID="btnNext" runat="server" CausesValidation="True" OnClick="btnNext_Click" ToolTip=" Proceed to Payment"
                                CssClass="btn btn-success" Text="Next =>>" />--%>
<%--                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />--%>
                            <asp:Button ID="btnHome" runat="server" 
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---End of Button----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="991" />
</asp:Content>
