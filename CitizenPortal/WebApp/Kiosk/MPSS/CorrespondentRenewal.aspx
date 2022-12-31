<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="CorrespondentRenewal.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.CorrespondentRenewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <%--<script src="bootstrap-datetimepicker.min.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <%--<link href="bootstrap-datetimepicker.css" rel="stylesheet" />
    <link href="bootstrap-datetimepicker.min.css" rel="stylesheet" />--%>
    <script src="../../Scripts/ServiceLanguage.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
    <style>
        .panel-body {
            padding: 15px;
        }

        fieldset {
            padding: 10px;
            border: 1px solid #37495f;
            border-radius: 5px;
        }

        legend {
            display: block;
            width: auto;
            padding: 0;
            margin-bottom: 10px;
            font-size: 18px;
            line-height: inherit;
            color: #37495f;
            border: 0;
            border-bottom: none;
            font-weight: bold;
            padding: 0px 10px;
        }

        #ContentPlaceHolder1_ddlStudenID_ddlStudenID_TextBox {
            background-color: #ADD8E6;
            border: solid 1px Blue;
            border-right: 0px none;
            width: 100% !important;
            height: 33px !important;
        }

        .ContentPlaceHolder1_ddlStudenID_ddlStudenID_Button {
            background-color: #ADD8E6;
            border: solid 1px Blue;
        }

        /*  .CustomComboBoxStyle .ajax__combobox_textboxcontainer input {
    background-color: #ADD8E6;
    border: solid 1px Blue;
    border-right: 0px none;
}*/


        .ajax__combobox_buttoncontainer button {
            width: 15px !important;
            height: 20px !important;
        }

        .ajax__combobox_itemlist {
            position: relative !important;
            left: 0px !important;
            top: 3px !important;
            width: 175px !important;
            height: 150px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p0" id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%-- <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>ScholarShip Form</h2>
            </div>
        </div>--%>


            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-md-12 box-container" runat="server" id="div5">

                        <div class="box-heading form_hd">
                            <div class="box-heading form_hd">
                                <h2> {{resourcesData.lblCorrespond1}}</h2>

                            </div>
                        </div>

                    </div>
                    <div class="col-md-12 box-container" runat="server" id="div1">

                        <div class="box-heading form_hd">
                            <div class="box-heading form_hd">
                                <h4>{{resourcesData.lblCorrespond2}}</h4>

                            </div>
                        </div>

                    </div>
                    <div class="col-lg-12">
                        <div class="alert alert-success">
                            <p><b>{{resourcesData.lblInstruction}}</b></p>

                        </div>
                    </div>
                </div>





                <div>


                    <div id="smartwizard">
                        <ul>
                            <li class="done active"><a href="#step-1">Step 1<br />
                                <small id="lblsearch">{{resourcesData.lblCorrespond560}}</small></a></li>
                            <li class="done active"><a href="#step-2">Step 2<br />
                                <small>{{resourcesData.lblCorrespond561}}</small></a></li>
                            <li class="done active"><a href="#step-3">Step 3<br />
                                <small>{{resourcesData.lblCorrespond562}}</small></a></li>
                            <li class="done active"><a href="#step-4">Step 4<br />
                                <small>{{resourcesData.lblCorrespond563}}</small></a></li>
                            <li class="done active"><a href="#step-5">Step 5<br />
                                <small>{{resourcesData.lblCorrespond564}}</small></a></li>
                            <li class="done active"><a href="#step-6">Step 6<br />
                                <small>{{resourcesData.lblCorrespond565}}</small></a></li>
                            <li class="done active"><a href="#step-7">Step 7<br />
                                <small>{{resourcesData.lblCorrespond566}}</small></a></li>
                            <li class="done active"><a href="#step-8">Step 8<br />
                                <small>{{resourcesData.lblCorrespond567}}</small></a></li>
                            <li class="done active"><a href="#step-9">Step 9<br />
                                <small>{{resourcesData.lblCorrespond568}}</small></a></li>
                            <li class="done active"><a href="#step-10">Step 10<br />
                                <small>{{resourcesData.lblCorrespond569}}</small></a></li>

                        </ul>
                        <div class="mt-4">
                            <div id="step-1">
                                <div class="row">
                                    <fieldset id="divStudentInnfo" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblCorrespond3}}</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                            <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond4}}</label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="rbCRCS1" runat="server" Text="{{resourcesData.lblCorrespond5}}" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="rbCRCS2" runat="server" Text="{{resourcesData.lblCorrespond6}}" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton ID="rbCRCS3" runat="server" Text="{{resourcesData.lblCorrespond7}}" GroupName="CRCS" Checked="true" />
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="rbCRCS4" runat="server" Text="{{resourcesData.lblCorrespond8}}" GroupName="CRCS" />

                                                </div>
                                            </div>



                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="rbCRCS5" runat="server" Text="{{resourcesData.lblCorrespond9}}" GroupName="CRCS" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">

                                                    <asp:RadioButton ID="rbCRCS6" runat="server" Text="{{resourcesData.lblCorrespond10}}" GroupName="CRCS" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond11}}</label>
                                                    <asp:TextBox ID="txtSocietyName" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Society Name and Address"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSocietyName" Display="Dynamic"
                                                            ErrorMessage="Please Enter Society Name and Address." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond12}}</label>
                                                    <asp:TextBox ID="txtSchoolName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSchoolName" Display="Dynamic"
                                                            ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblCorrespond13}}</label>
                                                    <asp:TextBox ID="txtSchoolAddress" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School Name"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSchoolAddress" Display="Dynamic"
                                                            ErrorMessage="Please Enter School Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <legend>&nbsp {{resourcesData.lblCorrespond14}}</legend>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond15}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                                        ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond16}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtColony" Display="Dynamic"
                                                        ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond17}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                                        ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                  {{resourcesData.lblCorrespond18}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtBlock" Display="Dynamic"
                                                        ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond19}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtDistrict" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                   {{resourcesData.lblCorrespond20}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                                        ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    {{resourcesData.lblCorrespond21}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSchoolMobile" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSchoolMobile" Display="Dynamic"
                                                        ErrorMessage="Please enter SchoolMobile No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div id="step-2">
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond24}}</legend>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond25}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSoceityRegNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSoceityRegNo" Display="Dynamic"
                                                    ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond26}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSoceityRegDate" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSoceityRegDate" Display="Dynamic"
                                                    ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond27}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSoceityValDate" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSoceityValDate" Display="Dynamic"
                                                    ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond28}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPANNO" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPANNO" Display="Dynamic"
                                                    ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond29}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSoceityNoOfMember" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSoceityNoOfMember" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div id="divCheque" class="col-md-12 box-container">
                                            <div class="box-heading">
                                                <h4 class="box-title manadatory">{{resourcesData.lblCorrespond30}}
                                      
                                                </h4>
                                            </div>
                                            <div class="box-body box-body-open p0">
                                                <div class="col-lg-12">
                                                    <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgAttachLstSocM" />
                                                    <input class="camera" id="fileSocietyMembersReg" name="fileSocietyMembersReg" type="file" runat="server" />
                                                    <asp:Button ID="Button1" type="submit" Text="Upload" runat="server" OnClick="Button1_Click"></asp:Button>
                                                    <asp:Panel ID="Panel3" Visible="False" runat="server">
                                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                                    </asp:Panel>

                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond31}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSocietyDirectorName" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSocietyDirectorName" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                 {{resourcesData.lblCorrespond32}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSocietyCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSocietyCity" Display="Dynamic"
                                                    ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                               {{resourcesData.lblCorrespond33}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSocietyPost" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtSocietyPost" Display="Dynamic"
                                                    ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond34}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSocietyDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtSocietyDistrict" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblCorrespond36}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSocietyPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtSocietyPinCode" Display="Dynamic"
                                                    ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                 {{resourcesData.lblCorrespond35}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSocietyMobileNo" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtSocietyMobileNo" Display="Dynamic"
                                                    ErrorMessage="Please enter SchoolMobile No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory"> {{resourcesData.lblCorrespond37}}</label>
                                            <asp:TextBox ID="txtSocietyOtherOperated" CssClass="form-control" TextMode="MultiLine" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Other operate Society School Name and Address"></asp:TextBox>

                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblCorrespond38}}</legend>
                                    <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                        <div class="form-group">
                                            <label class="manadatory"> {{resourcesData.lblCorrespond39}}</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbOAreaSchoolOperated1" runat="server" Text="{{resourcesData.lblCorrespond41}}" GroupName="rbOAreaSchoolOperated1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbOAreaSchoolOperate2" runat="server" Text="{{resourcesData.lblCorrespond42}}" GroupName="rbOAreaSchoolOperated1" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond43}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtMunicipalCorp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtMunicipalCorp" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond44}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtDisSchoolHeadQuater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDisSchoolHeadQuater" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond45}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPoliceSt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtNrPoliceSt" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond46}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPoliceStDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtNrPoliceStDistance" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond47}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPoliceStDivision" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtNrPoliceStDivision" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond48}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPolicePhNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtNrPolicePhNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond49}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrGovtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtNrGovtHighSch" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond50}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrGovtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtNrGovtHighSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond555}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrGovtHighSchDistance" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtNrGovtHighSchDistance" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>


                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond51}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrGovtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtNrGovtHigherSch" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond52}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrGovtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtNrGovtHigherSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond53}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrGovtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtNrGovtHigherSchDist" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond54}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPvtHighSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtNrPvtHighSch" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond55}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPvtHighSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtNrPvtHighSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond56}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPvtHighSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtNrPvtHighSchDist" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond57}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPvtHigherSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtNrPvtHigherSch" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond58}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPvtHigherSchAdd" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtNrPvtHigherSchAdd" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond59}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNrPvtHigherSchDist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtNrPvtHigherSchDist" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12  col-sm-2 col-md-2 col-lg-2">

                                        <div class="form-group">
                                            <label class="manadatory"> {{resourcesData.lblCorrespond60}}</label>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbSchoolType1" runat="server" Text="{{resourcesData.lblCorrespond61}}" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbSchoolType2" runat="server" Text="{{resourcesData.lblCorrespond62}}" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton ID="rbSchoolType3" runat="server" Text="{{resourcesData.lblCorrespond63}}" GroupName="rbSchoolType1" Checked="true" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbSchoolType4" runat="server" Text="{{resourcesData.lblCorrespond64}}" GroupName="rbSchoolType1" />

                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond65}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton ID="rbSocietyBrd1" runat="server" Text="{{resourcesData.lblCorrespond66}}" GroupName="rbSocietyBrd1" Checked="true" />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbSocietyBrd2" runat="server" Text="{{resourcesData.lblCorrespond67}}" GroupName="rbSocietyBrd1" />

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond68}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtBrdUni" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtBrdUni" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond69}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFromDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtFromDate" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                              {{resourcesData.lblCorrespond70}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtRegNo" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtRegNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond71}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtRegDate" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtRegDate" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond72}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtRunCommitteeSch" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtRunCommitteeSch" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond73}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSchPraveshika" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtSchPraveshika" Display="Dynamic"
                                                    ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond74}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond75}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetLKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond76}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetUKG" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond77}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetCls14" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond78}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsPrav" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond79}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsPrathma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond80}}
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsDuti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond81}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond82}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsPoravePth" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond83}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsPoraveAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond84}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsPoraveUtt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond85}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSankiyadetClsPoraveUttAnti" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                </fieldset>

                                <div class="clearfix"></div>

                                <div class="row">
                                    <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblCorrespond86}}</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="divCheque" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">  {{resourcesData.lblCorrespond87}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgAttachTime" />
                                                        <input class="camera" id="fileAttTime" name="fileAttTime" type="file" runat="server" />
                                                        <asp:Button ID="btnTimetables" type="submit" Text="Upload" runat="server" OnClick="btnTimetables_Click"></asp:Button>
                                                        <asp:Panel ID="Panel1" Visible="False" runat="server">
                                                            <asp:Label ID="lblAttTime" runat="server"></asp:Label>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div id="divPassbook" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond88}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgAttachedSubject" />
                                                        <input class="camera" id="fileAttachedSubject" name="fileAttachedSubject" type="file" runat="server" />
                                                        <asp:Button ID="btnSubject" type="submit" Text="Upload" runat="server" OnClick="btnSubject_Click"></asp:Button>
                                                        <asp:Panel ID="Panel2" Visible="False" runat="server">
                                                            <asp:Label ID="lblAttachedSubject" runat="server"></asp:Label>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>

                                <div class="clearfix"></div>
                            </div>
                            <div id="step-3">
                                <div class="row">
                                    <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp  {{resourcesData.lblCorrespond202}}</legend>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond203}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHeadMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtHeadMist" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond204}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHeadMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="txtHeadMistQual" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond205}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPrinMist" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="txtPrinMist" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond556}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPrinMistQual" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtPrinMistQual" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond207}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond208}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond209}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond210}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond211}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond212}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond213}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond214}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMSQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond215}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMSQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond216}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMSQTShikSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond217}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMSQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond218}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMSQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond219}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond220}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond221}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond222}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond223}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond224}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond225}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond226}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHCQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond227}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHCQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond228}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHCQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond229}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHCQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond230}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHCQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond231}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond232}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAQTMED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond233}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAQTBED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond234}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAQTShikshaSha" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond235}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAQTDED" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond236}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAQTBTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond237}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAQTPTI" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtAQTPTI" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond238}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAssitTeachSci" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtAssitTeachSci" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond239}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtStudMed" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtStudMed" Display="Dynamic"
                                                        ErrorMessage="Please enter Field." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond240}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond241}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtFeesPrathama" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond242}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtFeesPurvamadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond243}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtFeesUttarmadiyma" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond244}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond245}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtLedger" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond246}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAssistantOff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond247}}
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-1 col-md-1 col-lg-1">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtFourthGrade" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </fieldset>
                                </div>
                            </div>
                            <div id="step-4">
                                <fieldset>
                                    <legend>&nbsp     {{resourcesData.lblCorrespond89}}</legend>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond90}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond91}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond92}}
                                            </label>
                                            <asp:TextBox ID="txtMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond93}}
                                            </label>
                                            <asp:TextBox ID="txtMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond94}}
                                            </label>
                                            <asp:TextBox ID="txtMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond95}}
                                            </label>
                                            <asp:TextBox ID="txtMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond96}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond97}}
                                            </label>
                                            <asp:TextBox ID="txtAFTMorgFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond98}}
                                            </label>
                                            <asp:TextBox ID="txtAFTMorgFC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                              {{resourcesData.lblCorrespond99}}
                                            </label>
                                            <asp:TextBox ID="txtAFTMorgTT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond100}}
                                            </label>
                                            <asp:TextBox ID="txtAFTMorgTC" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </fieldset>
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond570}}</legend>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond101}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond102}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtKhasra" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond103}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div id="divCheque" class="col-md-12 box-container">
                                            <div class="box-heading">
                                                <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond104}}
                                      
                                                </h4>
                                            </div>
                                            <div class="box-body box-body-open p0">
                                                <div class="col-lg-12">
                                                    <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgLandReg" />
                                                    <input class="camera" id="fileLandReg" name="fileLandReg" type="file" runat="server" />
                                                    <asp:Button ID="Button2" type="submit" Text="Upload" runat="server" OnClick="Button2_Click"></asp:Button>
                                                    <asp:Panel ID="Panel4" Visible="False" runat="server">
                                                        <asp:Label ID="lblLandReg" runat="server"></asp:Label>
                                                    </asp:Panel>

                                                </div>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond105}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtRentAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond106}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtRentOwnerAdd" runat="server" TextMode="MultiLine" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="divCheque" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond107}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgRentAgreement" />
                                                        <input class="camera" id="fileRentAgreement" name="fileRentAgreement" type="file" runat="server" />
                                                        <asp:Button ID="Button3" type="submit" Text="Upload" runat="server" OnClick="Button3_Click"></asp:Button>
                                                        <asp:Panel ID="Panel5" Visible="False" runat="server">
                                                            <asp:Label ID="lblRentAgreement" runat="server"></asp:Label>
                                                        </asp:Panel>

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        {{resourcesData.lblCorrespond108}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAreaSchLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                          {{resourcesData.lblCorrespond109}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtAreaSchBuildLand" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                       {{resourcesData.lblCorrespond110}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtTotalAreaSchBuild" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <label class="manadatory" for="ddlDistrict">
                                                        {{resourcesData.lblCorrespond111}}
                                                    </label>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtTotalAreaSchBuildEmty" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                </fieldset>
                            </div>
                            <div id="step-5">
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblCorrespond112}}</legend>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond113}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFClsStudy" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                              {{resourcesData.lblCorrespond114}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFDArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond115}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFDSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond116}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFRoomsTEACH" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond117}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFRoomsTEACHArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond118}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFRoomsTEACHSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond119}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFRoomsLabLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond120}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFRoomsLabLibArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                               {{resourcesData.lblCorrespond121}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtNoOFRoomsLabLibSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                  {{resourcesData.lblCorrespond122}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPlayArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond123}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPlaySqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond124}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtTotalNoToil" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond125}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtTotalNoToilGl" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond126}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtTotalNoToilBY" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond127}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtEqipWater" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond128}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond129}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSubLabNum" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond130}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSubLabArea" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond131}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtSubLabSqFT" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div id="divCheque" class="col-md-12 box-container">
                                            <div class="box-heading">
                                                <h4 class="box-title manadatory"> {{resourcesData.lblCorrespond559}}
                                      
                                                </h4>
                                            </div>
                                            <div class="box-body box-body-open p0">
                                                <div class="col-lg-12">
                                                    <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/AttachmentPic.jpg" name="ProfileCheque" Style="height: 180px" ID="imgLabEquipments" />
                                                    <input class="camera" id="fileLabEquipments" name="fileLabEquipments" type="file" runat="server" />
                                                    <asp:Button ID="Button4" type="submit" Text="Upload" runat="server" OnClick="Button4_Click"></asp:Button>
                                                    <asp:Panel ID="Panel6" Visible="False" runat="server">
                                                        <asp:Label ID="lblLabEquipments" runat="server"></asp:Label>
                                                    </asp:Panel>

                                                </div>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond132}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond133}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtNoBooks" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond134}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAreaLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond135}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSqFTLib" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond136}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond137}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotFurt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond138}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotFurtGB" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond139}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotChaires" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond140}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotBenches" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond141}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotFurtStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                   {{resourcesData.lblCorrespond142}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotChairStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond143}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotAlmariresStaff" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond144}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:RadioButton ID="rbElectric1" runat="server" Text="{{resourcesData.lblCorrespond66}}" GroupName="rbElectric1" Checked="true" />

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">

                                                <asp:RadioButton ID="rbElectric2" runat="server" Text="{{resourcesData.lblCorrespond67}}" GroupName="rbElectric1" />
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond147}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotComp" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond148}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotPrinter" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond149}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotFaxes" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    {{resourcesData.lblCorrespond150}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotOther" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond151}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtTotFireExt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                     {{resourcesData.lblCorrespond152}}
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSummittedAmt" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                </fieldset>
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond153}}</legend>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblCorrespond154}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPhyHandStudFact" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                 {{resourcesData.lblCorrespond155}}
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbPhyHandStudAdPrv1" runat="server" Text="{{resourcesData.lblCorrespond66}}" GroupName="rbPhyHandStudAdPrv1" Checked="true" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton ID="rbPhyHandStudAdPrv2" runat="server" Text="{{resourcesData.lblCorrespond67}}" GroupName="rbPhyHandStudAdPrv1" />
                                        </div>
                                    </div>



                                </fieldset>
                                <div class="clearfix"></div>
                                <fieldset>
                                    <legend>&nbsp  {{resourcesData.lblCorrespond159}}</legend>
                                    {{resourcesData.lblCorrespond160}}<br />
                                    {{resourcesData.lblCorrespond161}}<br />
                                    sign<br />
                                    <br />
                                    <br />
                                    <br />
                                     {{resourcesData.lblCorrespond162}}
                                    <br />
                                    <br />
                                    {{resourcesData.lblCorrespond163}}<br />
                                    <br />
                                    <br />
                                    <br />

                                     {{resourcesData.lblCorrespond164}}<br />
                                    <br />

                                     {{resourcesData.lblCorrespond165}}<br />
                                    <br />

                                     {{resourcesData.lblCorrespond166}}<br />
                                    <br />
                                     {{resourcesData.lblCorrespond167}}<br />
                                    <br />
                                    {{resourcesData.lblCorrespond168}}<br />
                                    <br />
                                    <br />
                                    <br />

                                     {{resourcesData.lblCorrespond169}}<br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                   {{resourcesData.lblCorrespond170}}<br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                      {{resourcesData.lblCorrespond171}}
                                </fieldset>

                                <%---Start of Button----%>
                            </div>
                           <div id="step-6">
                                    <div class="row">
                                          <fieldset id="divAppendix1" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp  {{resourcesData.lblCorrespond249}}</legend>



                                            <div style="text-align: center;">{{resourcesData.lblCorrespond248}}</div>
                                          
                                           <br />
                                            <br />

                                           {{resourcesData.lblCorrespond250}}
                                            <br />
                                            <br />

                                            {{resourcesData.lblCorrespond251}}
                                            <br />
                                            <br />

                                            {{resourcesData.lblCorrespond252}}
                                            <br />
                                            <br />

                                             {{resourcesData.lblCorrespond253}}                                                                                                                       
                                                                                                                                             

                                          <br />
                                            <br />
                                            {{resourcesData.lblCorrespond254}}
                                           
                                            <br />
                                            <br />

                                              {{resourcesData.lblCorrespond255}}
                                            <br />
                                            <br />

                                               {{resourcesData.lblCorrespond256}}
                                            <br />
                                            <br />
                                             {{resourcesData.lblCorrespond257}}
                                                                                      <br />
                                            <br />
                                          
                                                                      
                                                {{resourcesData.lblCorrespond258}}
                                            <br />
                                            <br />
                                               {{resourcesData.lblCorrespond259}}
                                            <br />
                                            <br />
                                         {{resourcesData.lblCorrespond260}}
                                            <br />
                                            <br />
                                           
   {{resourcesData.lblCorrespond261}}
                                            <br />
                                            <br />
                                           
   {{resourcesData.lblCorrespond262}}
                                            <br />
                                            <br />
                                          {{resourcesData.lblCorrespond263}}
                                            <br />
                                            <br />
                                        {{resourcesData.lblCorrespond264}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond265}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond266}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond267}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond268}}
                                            <br />
                                            <br />
                                             {{resourcesData.lblCorrespond269}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond270}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond271}}
                                            <br />
                                            <br />
                                             {{resourcesData.lblCorrespond272}}
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond273}}
                                            <br />
                                            <br />
                                              {{resourcesData.lblCorrespond274}}
                                            <br />
                                            <br />
                                             {{resourcesData.lblCorrespond275}}
                                            <br />
                                            <br />
                                        </fieldset>

                                    </div>
                                </div>
                                <div id="step-7">
                                    <div class="row">
                                        <fieldset id="divAppendix2" style="width: 100%; margin-bottom: 15px;">
                                            <legend>&nbsp {{resourcesData.lblCorrespond566}}</legend>

                                            <div style="text-align: center;">{{resourcesData.lblCorrespond276}}</div>
                                            <br />
                                            <br />
                                            <div style="text-align: center;">{{resourcesData.lblCorrespond277}}</div>
                                            <br />
                                            <br />
                                           {{resourcesData.lblCorrespond278}}
 
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond279}}<br />
                                            <br />
                                            {{resourcesData.lblCorrespond280}}<br />
                                            <br />
                                           {{resourcesData.lblCorrespond281}}<br />
                                            <br />
                                           {{resourcesData.lblCorrespond282}}<br />
                                            <br />
                                          {{resourcesData.lblCorrespond283}}<br />
                                            <br />
                                          {{resourcesData.lblCorrespond284}}
                                            <br />
                                            <br />
                                           {{resourcesData.lblCorrespond285}}
                                            <br />
                                            <br />
                                           {{resourcesData.lblCorrespond286}}
                                            <br />
                                            <br />
                                     {{resourcesData.lblCorrespond287}}<br />
                                            <br />
                                            <br />
                                            <br />
                                            {{resourcesData.lblCorrespond288}}<br />
                                            <br />
                                           {{resourcesData.lblCorrespond289}}<br />
                                            <br />
                                            <div style="align-items: center">{{resourcesData.lblCorrespond290}}</div>
                                            <br />
                                            <br />

                                          {{resourcesData.lblCorrespond291}}<br />
                                            <br />
                                           {{resourcesData.lblCorrespond292}}
                                             <br />
                                            <br />
                                           {{resourcesData.lblCorrespond293}}
                                            <br />
                                            <br />
                                        </fieldset>
                                    </div>
                                </div>
                            <div id="step-8">
                                <div class="row">
                                    <fieldset id="divAppendix3" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblCorrespond294}}</legend>

                                        <div style="text-align: center;">{{resourcesData.lblCorrespond294}}</div>
                                        <br />
                                        <br />
                                        <div style="text-align: center;">{{resourcesData.lblCorrespond295}}</div>
                                        <br />
                                        <br />
                                        {{resourcesData.lblCorrespond296}} -<br />
                                        <br />
                                         {{resourcesData.lblCorrespond297}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond298}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond299}}
 Submission will be mandatory.<br />
                                        <br />
                                         {{resourcesData.lblCorrespond300}}<br />
                                        <br />
                                        <br />
                                        <br />


                                        {{resourcesData.lblCorrespond301}}<br />
                                        <br />

                                      {{resourcesData.lblCorrespond302}}<br />
                                            <br />
                                           <br />
                                            <br />
                                           <div style="text-align:center;align-items:center;display: flex;justify-content: center;">
                                            <table style="border:1px solid black;border-collapse:collapse;">
                                                <thead style="border:1px solid black;border-collapse:collapse;">
                                                     <th style="border:1px solid black;border-collapse:collapse;">Serial No</th>
                                                     <th style="border:1px solid black;border-collapse:collapse;">Class level for the year</th>
                                                     <th style="border:1px solid black;border-collapse:collapse;">Fixed fee amount for New affiliation(for one year)</th>
                                                </thead>
                                                <tr>
                                                    <td style="border:1px solid black;border-collapse:collapse;">1</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> L.K.G.  (Arun) to class 04 </td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> 1,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">2</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">L.K.G.  (Arun) to Praveshika</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">3,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">3</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> L.K.G.  (Arun) to Prathma</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">2,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">4</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;"> L.K.G.  (Arun)  again one</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">11,000/-</td>
                                                </tr>
                                                 <tr style="border:1px solid black;border-collapse:collapse;">
                                                    <td style="border:1px solid black;border-collapse:collapse;">5</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">(From L.K.G. (Assam) to his</td>
                                                    <td style="border:1px solid black;border-collapse:collapse;">13,000/-</td>
                                                </tr>
                                            </table>
                                           </div>
  
 
                                            <br />
                                            <br />
                                       {{resourcesData.lblCorrespond310}}
                                        <br />
                                        <br />
                                     {{resourcesData.lblCorrespond311}}
                                        <br />
                                        <br />
                                        {{resourcesData.lblCorrespond312}}
                                        <br />
                                        <br />
                                        {{resourcesData.lblCorrespond313}}
 Enter the PIN code of
                                        <br />
                                        <br />
                                       {{resourcesData.lblCorrespond314}}
                                        <br />
                                        <br />
                                         {{resourcesData.lblCorrespond315}}
                                    </fieldset>
                                </div>
                            </div>
                            <div id="step-9">
                                <div class="row">
                                    <fieldset id="divAppendix4" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp  {{resourcesData.lblCorrespond316}}</legend>
                                        <div style="text-align: center;"> {{resourcesData.lblCorrespond317}}</div>
                                        <br />
                                        <br />
                                        <div style="text-align: center;">
                                            {{resourcesData.lblCorrespond318}}
 and criteria
                                        </div>
                                        <br />
                                        <br />
                                        <div style="text-align: center;">{{resourcesData.lblCorrespond319}}</div>
                                        <br />
                                        <br />
                                       {{resourcesData.lblCorrespond320}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond321}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond322}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond323}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond324}}
                                      <br />
                                        <br />
                                        {{resourcesData.lblCorrespond325}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond326}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond327}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond328}}
 By Panchayat.<br />
                                        <br />
                                        {{resourcesData.lblCorrespond329}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond330}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond331}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond332}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond333}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond334}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond335}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond336}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond337}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond338}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond339}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond340}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond341}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond342}}<br />
                                        <br />
                                        <br />
                                        <br />
                                       {{resourcesData.lblCorrespond343}}

                                    </fieldset>
                                </div>
                            </div>
                            <div id="step-10">
                                <div class="row">
                                    <fieldset id="divAppendix5" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblCorrespond344}}</legend>
                                        <div style="text-align: center;">{{resourcesData.lblCorrespond344}}</div>
                                        <br />
                                        <br />
                                        <div style="text-align: center;">
                                           {{resourcesData.lblCorrespond345}}<br />
                                            <br />
                                           {{resourcesData.lblCorrespond346}}<br />
                                            <br />
                                           {{resourcesData.lblCorrespond347}}
                                        </div>
                                        <br />
                                        <br />
                                        {{resourcesData.lblCorrespond348}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond349}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond350}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond351}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond352}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond353}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond354}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond355}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond356}}<br />
                                        <br />
                                          {{resourcesData.lblCorrespond357}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond358}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond359}}
                                            <br />
                                        <br />
                                         {{resourcesData.lblCorrespond360}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond361}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond362}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond363}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond364}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond365}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond366}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond367}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond368}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond369}}-<br />
                                        <br />
                                       {{resourcesData.lblCorrespond370}}
                                        <br />
                                        {{resourcesData.lblCorrespond371}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond372}}
                                        <br />
                                       {{resourcesData.lblCorrespond373}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond374}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond375}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond376}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond377}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond378}}<br />
                                        <br />
                                       {{resourcesData.lblCorrespond379}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond380}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond381}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond382}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond383}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond384}}
 be marked<br />
                                        <br />
                                        {{resourcesData.lblCorrespond385}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond386}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond387}}<br />
                                        <br />
                                         {{resourcesData.lblCorrespond388}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond389}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond390}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond391}}<br />
                                        <br />

                                   {{resourcesData.lblCorrespond392}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond393}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond394}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond395}}<br />
                                        <br />
                                        {{resourcesData.lblCorrespond396}}<br />
                                        <br />

                                    </fieldset>

                                    <fieldset>

                                        <div class="box-body box-body-open" style="text-align: center;">
                                            <asp:Button ID="btnSubmit" Enabled="true" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                                                CssClass="btn btn-success" Text="Submit" ValidationGroup="G" OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                                CssClass="btn btn-danger" PostBackSection=""
                                                Text="Cancel" />
                                        </div>


                                        <asp:ValidationSummary runat="server" ID="ValidationSummary1"
                                            DisplayMode="BulletList"
                                            ShowMessageBox="False" ValidationGroup="G" ShowSummary="True" CssClass="alert alert-danger" />
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hdnLandReg" runat="server" />
    <asp:HiddenField ID="hdnLandRegPath" runat="server" />
    <asp:HiddenField ID="hdnAttachedSubjectPath" runat="server" />
    <asp:HiddenField ID="hdnAttachedSubject" runat="server" />
    <asp:HiddenField ID="hdnAttachLstSocM" runat="server" />
    <asp:HiddenField ID="hdnAttachLstSocMPath" runat="server" />
    <asp:HiddenField ID="hdnAttachTime" runat="server" />
    <asp:HiddenField ID="hdnAttachTimePath" runat="server" />
    <asp:HiddenField ID="hdnRentAgreement" runat="server" />
    <asp:HiddenField ID="hdnRentAgreementPath" runat="server" />
     <asp:HiddenField ID="hdnLabEquipments" runat="server" />
    <asp:HiddenField ID="hdnLabEquipmentsPath" runat="server" />


    <link href="/WebApp/Styles/smart_wizard.min.css" rel="stylesheet" />
    <link href="/WebApp/Styles//smart_wizard_theme_arrows.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts//jquery.smartWizard.min.js" type="text/javascript"></script>

    <script>
        $(document).ready(function () {

            $('#smartwizard').smartWizard({
                selected: 0,
                theme: 'arrows',
                autoAdjustHeight: true,
                transitionEffect: 'fade',
                showStepURLhash: false

            });
            //$('#smartwizard').append("<button class='btn btn-info'>Save Draft</button>")

        });


    </script>
    <style>
        .sw-theme-arrows .step-content {
            padding: 20px 13px 8px;
            border: 0 solid #d4d4d4;
            background-color: #fbfbfb;
            text-align: left;
        }

            .sw-theme-arrows .step-content .input-group {
                display: block;
            }

            .sw-theme-arrows .step-content .input-group-addon {
                height: auto;
            }

        .sw-theme-arrows > ul.step-anchor > li > a small, .sw-theme-arrows > ul.step-anchor > li > a small {
            font-size: 11px;
        }

        .sw-theme-arrows > ul.step-anchor > li > a, .sw-theme-arrows > ul.step-anchor > li > a {
            padding: 5px 0 5px 45px;
        }

            .sw-theme-arrows > ul.step-anchor > li > a:hover, .sw-theme-arrows > ul.step-anchor > li > a:hover {
                padding: 5px 0 5px 45px;
            }

        .sw-theme-arrows > ul.step-anchor {
            display: flex;
            width: 100%;
            -ms-flex-direction: row;
            flex-direction: row;
        }

        .nav-tabs > li {
            /* float: left; */
            margin-bottom: -1px;
            flex: auto;
        }

        .sw-theme-arrows #step-4.step-content .input-group-addon {
            height: auto;
        }

        .sw-theme-arrows #step-5.step-content .input-group-addon {
            height: 50px;
        }

        .sw-toolbar-bottom .btn-group.mr-2.sw-btn-group {
            float: none;
            display: block;
        }

        .sw-toolbar-bottom button.btn.btn-secondary.sw-btn-next {
            float: right;
            background: #ff7124;
            color: #fff;
            font-size: 15px;
            border-top-left-radius: 4px !important;
            border-bottom-left-radius: 4px !important;
        }

        .sw-toolbar-bottom button.btn.btn-secondary.sw-btn-prev {
            background: #682e2e;
            color: #fff;
            font-size: 15px;
            border-radius: 4px !important;
        }

        .sw-theme-arrows > ul.step-anchor > li.active > a {
            border-color: #37495f !important;
            color: #fff !important;
            background: #37495f !important;
        }

            .sw-theme-arrows > ul.step-anchor > li.active > a:after {
                border-left: 30px solid #37495f !important;
            }

        .sw-theme-arrows > ul.step-anchor > li.done > a {
            border-color: #37495f !important;
            color: #fff !important;
            background: #37495f !important;
        }

            .sw-theme-arrows > ul.step-anchor > li.done > a:after {
                border-left: 30px solid #37495f;
            }
    </style>
</asp:Content>
